defmodule Wedding.Repo.Migrations.CreateRsvp do
  use Ecto.Migration

  def change do
    create table(:rsvps) do
      add :first_name, :string
      add :last_name, :string
      add :luncheon, :boolean, default: false, null: false
      add :sealing, :boolean, default: false, null: false

      timestamps()
    end

  end
end
