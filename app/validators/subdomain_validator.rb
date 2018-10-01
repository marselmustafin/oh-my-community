class SubdomainValidator < ActiveModel::EachValidator
  SUBDOMAIN_REGEXP = /^[a-z0-9\-]+$/

  def validate_each(record, attribute, value)
    validate_reserving(record, attribute, value)
    validate_characters(record, attribute, value)
  end

  private

  def validate_reserving(record, attribute, value)
    record.errors.add(attribute, "is reserved") if reserved_subdomains.include?(value)
  end

  def reserved_subdomains
    YAML.load_file(Rails.root.join("app", "validators", "reserved-subdomains.yaml"))
  end

  def validate_characters(record, attribute, value)
    record.errors.add(attribute, "has invalid format") unless SUBDOMAIN_REGEXP.match?(value)
    record.errors.add(attribute, "can't end with dash") if value.end_with?("-")
    record.errors.add(attribute, "can't start with dash") if value.start_with?("-")
  end
end
