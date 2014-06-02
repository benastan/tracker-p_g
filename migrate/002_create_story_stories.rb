Sequel.migration do
  up do
    create_table :story_stories do
      primary_key :id
      Integer :parent_story_id
      Integer :child_story_id
    end
  end

  down do
    drop_table :story_stories
  end
end