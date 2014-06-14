Sequel.migration do
  up do
    add_column :stories, :started_at, DateTime
  end

  down do
    drop_column :stories, :started_at
  end
end
