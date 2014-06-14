Sequel.migration do
  up do
    add_column :stories, :closed_at, DateTime
  end

  down do
    drop_column :stories, :closed_at
  end
end
