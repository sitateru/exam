require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    let(:params) {
      { user: { name: "arther", mail_address: "arther@mail.com" } }
    }

    before { post "/users", params: params }
    let(:response_body) { JSON.parse(response.body, object_class: OpenStruct) }

    it { expect(response.code).to eq "200" }
    it { expect(response_body.payload.name).to eq "arther" }
  end

  describe "#update" do
    let(:ins_params) {
      { user: { name: "bell", mail_address: "bell@mail.com" } }
    }
    before { post "/users", params: ins_params }
    let(:ins_response_body) { JSON.parse(response.body, object_class: OpenStruct) }
    it { expect(response.code).to eq "200" }
    it { expect(ins_response_body.payload.mail_address).to eq "bell@mail.com" }
    let(:target) { ins_response_body.payload }

    let(:upd_params) {
      { user: { id: target.id, name: target.name, mail_address: "bell@mail.co.jp" } }
    }
    before { patch "/users/#{target.id}", params: upd_params }
    let(:upd_response_body) { JSON.parse(response.body, object_class: OpenStruct) }
    it { expect(response.code).to eq "200" }
    it { expect(upd_response_body.payload.id.to_i).to eq target.id }
#    it { expect(upd_response_body.payload.mail_address).to eq "bell@mail.co.jp" }
  end
end
