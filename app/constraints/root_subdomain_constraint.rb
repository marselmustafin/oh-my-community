class RootSubdomainConstraint
  ROOT_DOMAINS = ["", "www"].freeze

  def self.matches?(request)
    ROOT_DOMAINS.include?(request.subdomain)
  end
end
