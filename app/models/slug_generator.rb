class SlugGenerator
  def generate(string)
    string = string.gsub('.', ' dot ')
    string.parameterize
  end
end
