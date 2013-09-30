class String #:nodoc:

  def titleize
    self.underscore.humanize.gsub(/\b([a-z])/) { $1.capitalize }
  end

  def humanize()
    self.gsub(/_id$/, "").gsub(/_/, " ").capitalize
  end

  def camelize(first_letter_in_uppercase = true)
    if first_letter_in_uppercase
      self.gsub(/\/(.?)/) { "::" + $1.upcase }.gsub(/(^|_)(.)/) { $2.upcase }
    else
      self.first + self.camelize[1..-1]
    end
  end

  def underscore
    self.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end

end
