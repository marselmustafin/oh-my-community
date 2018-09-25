class SubdomainConstraint
  RESERVED_SUBDOMAINS = %w[www admin mail ftp].freeze

  def self.matches?(request)
    request.subdomain.present? && !RESERVED_SUBDOMAINS.include?(request.subdomain)
  end
end
