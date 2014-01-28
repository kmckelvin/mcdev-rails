require 'spec_helper'

describe "presentations/_presentation.html.slim" do
  context "when there is a video url" do
    it "renders the video link" do
      video_url = "http://VIDEO_URL"
      presentation = build(:presentation, video_url: video_url)

      render partial: 'presentation', locals: { presentation: presentation }

      expect(rendered).to have_link nil, href: video_url
    end
  end

  context "when there is no video url" do
    it "doesn't render the video link" do
      video_url = ""
      presentation = build(:presentation, video_url: video_url)

      render partial: 'presentation', locals: { presentation: presentation }

      expect(rendered).not_to include "video"
    end
  end

  context "when there is a slides url" do
    it "renders the slides link" do
      slides_url = "http://slides_URL"
      presentation = build(:presentation, slides_url: slides_url)

      render partial: 'presentation', locals: { presentation: presentation }

      expect(rendered).to have_link nil, href: slides_url
    end
  end

  context "when there is no slides url" do
    it "doesn't render the slides link" do
      slides_url = ""
      presentation = build(:presentation, slides_url: slides_url)

      render partial: 'presentation', locals: { presentation: presentation }

      expect(rendered).not_to include "slides"
    end
  end
end
