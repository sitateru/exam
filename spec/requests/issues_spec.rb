require 'rails_helper'

RSpec.describe "Issues", type: :request do

  describe "#index" do
    let!(:issue) { Issue.create(title: "title", body: "body", kind: :try) }
    
    before { get "/issues" }
    let(:response_body) { JSON.parse(response.body, object_class: OpenStruct) }

    it { expect(response.code).to eq "200" }
    it { expect(response_body.payload.map{ |d| d['id'] }).to include issue.id }
  end

  describe "#create" do
    let(:params) {
      { issue: { title: "title", body: "body", kind: :try } }
    }

    before { post "/issues", params: params }
    let(:response_body) { JSON.parse(response.body, object_class: OpenStruct) }

    it { expect(response.code).to eq "200" }
    it { expect(response_body.payload.body).to eq "body" }
  end
  
end
