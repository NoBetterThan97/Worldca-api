Sequel.migration do
  change do
    drop_table(:popularities)
  end
end