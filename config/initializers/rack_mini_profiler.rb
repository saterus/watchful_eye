if defined?(Rack::MiniProfiler)
  Rack::MiniProfiler.config.position = 'right'
  Rack::MiniProfiler.config.skip_schema_queries = true
end

