return {
  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        rememberBuffers = false,
        mappings = {
          {
            pattern = "/app/models/(.*).rb",
            target = {
              { target = "/spec/models/%1_spec.rb", context = "spec" },
              { target = "/spec/factories/%1.rb", context = "factory", transformer = "pluralize" },
              { target = "/app/controllers/**/%1_controller.rb", context = "controller", transformer = "pluralize" },
              { target = "/app/views/%1/**/*.html.*", context = "view", transformer = "pluralize" },
            },
          },
          {
            pattern = "/spec/models/(.*)_spec.rb",
            target = {
              { target = "/app/models/%1.rb", context = "model" },
            },
          },
          {
            pattern = "/spec/factories/(.*).rb",
            target = {
              { target = "/app/models/%1.rb", context = "model", transformer = "singularize" },
              { target = "/spec/models/%1_spec.rb", context = "spec", transformer = "singularize" },
            },
          },
          {
            pattern = "/app/services/(.*).rb",
            target = {
              { target = "/spec/services/%1_spec.rb", context = "spec" },
            },
          },
          {
            pattern = "/spec/services/(.*)_spec.rb",
            target = {
              { target = "/app/services/%1.rb", context = "service" },
            },
          },
          {
            pattern = "/app/controllers/.*/(.*)_controller.rb",
            target = {
              { target = "/spec/controllers/%1_spec.rb", context = "spec" },
              { target = "/spec/requests/%1_spec.rb", context = "spec" },
              { target = "/spec/factories/%1.rb", context = "factory", transformer = "singularize" },
              { target = "/app/models/%1.rb", context = "model", transformer = "singularize" },
              { target = "/app/views/%1/**/*.html.*", context = "view" },
            }
          },
          {
            pattern = "/app/controllers/(.*)_controller.rb",
            target = {
              { target = "/spec/controllers/%1_spec.rb", context = "spec" },
              { target = "/spec/requests/%1_spec.rb", context = "spec" },
              { target = "/spec/factories/%1.rb", context = "factory", transformer = "singularize" },
              { target = "/app/models/%1.rb", context = "model", transformer = "singularize" },
              { target = "/app/views/%1/**/*.html.*", context = "view" },
            }
          },
          {
            pattern = "/app/views/(.*)/.*.html.*",
            target = {
              { target = "/spec/factories/%1.rb", context = "factory", transformer = "singularize" },
              { target = "/app/models/%1.rb", context = "model", transformer = "singularize" },
              { target = "/app/controllers/**/%1_controller.rb", context = "controller", transformer = "pluralize" },
            },
          },
          {
            pattern = "/app/graphql/resolvers/(.*)_resolver.rb",
            target = {
              { target = "/spec/graphql/resolvers/%1_resolver_spec.rb", context = "spec" },
            }
          },
          {
            pattern = "/spec/graphql/resolvers/(.*)_resolver_spec.rb",
            target = {
              { target = "/app/graphql/resolvers/%1_resolver.rb", context = "spec" },
            }
          },
          {
            pattern = "/app/graphql/mutations/(.*)_mutation.rb",
            target = {
              { target = "/spec/graphql/mutations/%1_mutation_spec.rb", context = "spec" },
            }
          },
          {
            pattern = "/app/graphql/resolvers/(.*)/(.*)_resolver.rb",
            target = {
              { target = "/spec/graphql/resolvers/%1/%2_resolver_spec.rb", context = "spec" },
            }
          },
          {
            pattern = "/app/graphql/mutations/(.*)/(.*)_mutation.rb",
            target = {
              { target = "/spec/graphql/mutations/%1/%2_mutation_spec.rb", context = "spec" },
            }
          },
          {
            pattern = "/spec/graphql/mutations/(.*)/(.*)_mutation_spec.rb",
            target = {
              { target = "/app/graphql/mutations/%1/%2_mutation.rb", context = "graphql" },
            }
          },
        },
      })
    end
  }
}
