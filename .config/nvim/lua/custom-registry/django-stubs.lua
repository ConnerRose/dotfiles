local Pkg = require "mason-core.package"
local registry = require "mason-registry"

return Pkg.new {
  name = "django-stubs",
  desc = "django-stubs",
  homepage = "https://pypi.org/project/django-stubs/",
  categories = { "Linter" },
  languages = { "Python" },
  install = function(ctx)
    local mypy = registry.get_package "mypy"
    assert(mypy:is_installed(), "mypy is not installed")
    ctx.spawn[mypy:get_install_path() .. "/venv/bin/python"] {
      "-m",
      "pip",
      "install",
      "django-stubs[compatible-mypy]",
    }
    ctx.receipt:with_primary_source(ctx.receipt.pip3 "django-stubs")
  end,
}
