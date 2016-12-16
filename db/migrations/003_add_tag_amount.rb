# frozen_string_literal: true
require 'sequel'

Sequel.migration do
  change do
    alter_table(:foods) do
      add_column :tag_amount, Integer
    end
  end
end
