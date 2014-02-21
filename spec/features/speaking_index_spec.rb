require 'spec_helper'

feature "Browsing the speaking index" do
  it "lists upcoming presentations" do
    presentation = create(:presentation, :future)

    visit root_url

    within "section.speaking" do
      within ".upcoming" do
        expect(page).to have_content presentation.title
        find(".presentation__video").click
        expect(current_url).to eq presentation.video_url
      end
    end

    visit root_url
    within "section.speaking" do
      within ".upcoming" do
        expect(page).to have_content presentation.title
        find(".presentation__slides").click
        expect(current_url).to eq presentation.slides_url
      end
    end
  end

  it "lists past presentations" do
    presentation = create(:presentation, :past)

    visit root_url
    within "section.speaking" do
      within ".past" do
        expect(page).to have_content presentation.title
      end
    end
  end

end
