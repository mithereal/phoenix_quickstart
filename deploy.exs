defmodule Platform.DeployCallbacks do
  import Gatling.Bash

   def before_mix_deps_get(_env) do
      bash("sudo", ~w[apt-get install wget])
    end

  def after_mix_deps_get(env)

  def before_mix_compile(env)
  def after_mix_compile(env)

   def before_mix_digest(env) do
      # optional: release may complain about this directory not existing
      bash("mkdir", ~w[-p priv/static], cd: env.build_dir)

      # you might also want to add the asset compiling here.
      # see the upgrade example below for details.
    end

  def after_mix_digest(env)

  def before_mix_release_init(env)
  def after_mix_release_init(env)

  def before_mix_release(env)
  def after_mix_release(env)

  def before_make_deploy_dir(env)
  def after_make_deploy_dir(env)

  def before_copy_release_to_deploy(env)
  def after_copy_release_to_deploy(env)

  def before_expand_release(env)
  def after_expand_release(env)

  def before_install_init_script(env)
  def after_install_init_script(env)

  def before_mix_ecto_setup(env)
  def after_mix_ecto_setup(env)

  def before_start_service(env)
  def after_start_service(env)

  def before_configure_nginx(env)
  def after_configure_nginx(env)

end