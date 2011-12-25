module Schedule
  class Engine < ::Rails::Engine
    isolate_namespace Schedule
    config.generators.template_engine :haml
    config.app_generators.template_engine :haml
  end
end
