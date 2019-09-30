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

  describe "#02:update record"  do
    let(:ins_params) {
      { issue: { title: "update test", body: "before update" } }
    }
    before { post "/issues", params: ins_params }
    let(:ins_response_body) { JSON.parse(response.body, object_class: OpenStruct) }
    it { expect(response.code).to eq "200" }
    it { expect(ins_response_body.payload.body).to eq "before update" }
    let(:target) { ins_response_body.payload }

    let(:upd_params) {
      { issue: { id: target.id, title: target.title, body: "updated", kind: target.kind } }
    }
    before { put "/issues/#{target.id}", params: upd_params }
    let(:upd_response_body) { JSON.parse(response.body, object_class: OpenStruct) }
    it { expect(response.code).to eq "200" }
    it { expect(upd_response_body.payload.id.to_i).to eq target.id }
    it { expect(upd_response_body.payload.body).to eq "updated" }
  end

  describe "#02:delete record"  do
    let(:ins_params) {
      { issue: { title: "delete test", body: "before delete" } }
    }
    before { post "/issues", params: ins_params }
    let(:ins_response_body) { JSON.parse(response.body, object_class: OpenStruct) }
    it { expect(response.code).to eq "200" }
    let(:target) { ins_response_body.payload }

    let(:del_params) {
      { issue: { id: target.id, del_flg: 1 } }
    }
    before { delete "/issues/#{target.id}", params: del_params }
    let(:del_response_body) { JSON.parse(response.body, object_class: OpenStruct) }
    it { expect(response.code).to eq "200" }
    it { expect(del_response_body.payload.del_flg.to_i).to eq 1 }
  end

end
