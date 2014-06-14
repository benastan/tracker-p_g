Sequel.migration do
  up do
    add_column :stories, :finished_at, DateTime
  end

  down do
    drop_column :stories, :finished_at
  end
end
