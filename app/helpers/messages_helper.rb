module MessagesHelper
  # Returns HTML from input text using GitHub-flavored Markdown.
  def markdown_to_html(text)
    Kramdown::Document.new(text, input: 'GFM').to_html
  end
end
