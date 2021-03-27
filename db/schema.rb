# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_27_165047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_recipes", force: :cascade do |t|
    t.boolean "favorited"
    t.bigint "recipe_id", null: false
    t.bigint "recipe_liker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "recipe_name"
    t.string "recipe_img"
    t.index ["recipe_id"], name: "index_favorite_recipes_on_recipe_id"
    t.index ["recipe_liker_id"], name: "index_favorite_recipes_on_recipe_liker_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.string "ingredients"
    t.string "instructions"
    t.string "img_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.bigint "recipe_creator_id"
    t.index ["recipe_creator_id"], name: "index_recipes_on_recipe_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "favorite_recipes", "recipes"
  add_foreign_key "favorite_recipes", "users", column: "recipe_liker_id"
  add_foreign_key "recipes", "users", column: "recipe_creator_id"
end
