require 'spec_helper'

describe "albums/new" do
  before(:each) do
    assign(:album, stub_model(Album,
      :title => "MyString",
      :author => "MyString"
    ).as_new_record)
  end

  it "renders new album form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => albums_path, :method => "post" do
      assert_select "input#album_title", :name => "album[title]"
      assert_select "input#album_author", :name => "album[author]"
    end
  end
end
