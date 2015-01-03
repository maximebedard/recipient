module Recipient
  class RecipientFormBuilder < ActionView::Helpers::FormBuilder
    
    def picture_field(method, options = {})
      self.multipart = true
      @template.file_field(@object_name, method, objectify_options(options))
    end

    def label(method, text = nil, options = {}, &block)
      @template.label(@object_name, method, text, objectify_options(options), &block)
    end

  end
end
