defmodule Platform.UpgradeCallbacks do
  import Gatling.Bash

  def before_mix_deps_get(env)
  def after_mix_deps_get(env)

  def before_mix_compile(env)
  def after_mix_compile(env)

  def before_mix_digest(env) do
      bash("npm", ~w[install], cd: env.build_dir)
      bash("npm", ~w[run deploy], cd: env.build_dir)
    end

  def after_mix_digest(env)

  def before_mix_release_init(env)
  def after_mix_release_init(env)

  def before_mix_release(env)
  def after_mix_release(env)

  def before_make_upgrade_dir(env)
  def after_make_upgrade_dir(env)

  def before_copy_release_to_upgrade(env)
  def after_copy_release_to_upgrade(env)

  def before_upgrade_service(env) do
      bash("mix", ~w[ecto.migrate], cd: env.build_dir)
    end
  def after_upgrade_service(env)

end
