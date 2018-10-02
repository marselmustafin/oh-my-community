class CommunitySubdomainConstraint
  RESERVED_SUBDOMAINS = %w[www].freeze

  def self.matches?(request)
    request.subdomain.present? && !RESERVED_SUBDOMAINS.include?(request.subdomain)
  end
end
