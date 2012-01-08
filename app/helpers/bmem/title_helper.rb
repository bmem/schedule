module Bmem
  module TitleHelper
    TITLE_ATTRIBUTES = [:title, :display_name, :name, :full_name]

    def page_title
      chunks = []
      if instance_variable_defined? '@page_title' then
        chunks << @page_title
      else
        record_title.try {|title| chunks << title}
      end
      chunks << controller_name.capitalize
      section_name = if controller.class.name.include? '::'
        mod_name = controller.class.name.split(/::/)[-2].downcase
        t "module.#{mod_name}", :default => mod_name
      else
        t 'site_name', :default => 'BMEM'
      end
      chunks << section_name
      chunks.join ' :: '
    end

    # The title of the record being displayed or edited, may be nil
    def record_title
      if controller.respond_to? :subject_record then
        controller.subject_record.try do |item|
          generic = item.class.model_name.human
          title = if item.new_record? then
            "New #{generic}"
          else
            title_sym = TITLE_ATTRIBUTES.find do |sym|
              item.respond_to? sym
            end
            title_sym ? item.send(title_sym) : "#{generic} #{item.id}"
          end
        end
      end
    end
  end
end
