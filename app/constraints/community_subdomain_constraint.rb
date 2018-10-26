class CommunitySubdomainConstraint
  RESERVED_SUBDOMAINS = YAML.load_file(Rails.root.join("app", "validators", "reserved-subdomains.yaml"))

  def self.matches?(request)
    request.subdomain.present? && !RESERVED_SUBDOMAINS.include?(request.subdomain)
  end
end
