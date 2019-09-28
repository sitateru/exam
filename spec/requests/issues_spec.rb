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

  describe "#01:title must be a required field" do
    let(:params) {
      { issue: { body: "body", kind: :try } }
    }
    it { expect{ post "/issues", params: params }.to raise_error(ActiveRecord::NotNullViolation) }
  end

  describe "#01:default value of kind must be problem" do
    let(:params) {
      { issue: { title: "title", body: "body" } }
    }
    before { post "/issues", params: params }
    let(:response_body) { JSON.parse(response.body, object_class: OpenStruct) }
    it { expect(response.code).to eq "200" }
    it { expect(response_body.payload.kind).to eq "problem" }
  end

end
