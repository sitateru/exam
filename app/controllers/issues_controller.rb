class IssuesController < ApplicationController
  def index
    render_ok(Issue.all)
  end

  def create
    issue = Issue.new(issue_params)

    if issue.save
      render_ok(issue)
    else
      render_ng(400, issue.errors)
    end
  end

  def update
    if Issue.where( id: issue_params[:id] ).update( title: issue_params[:title], body: issue_params[:body], kind: issue_params[:kind] )
      issue = Issue.find(issue_params[:id])
      render_ok(issue)
    else
      render_ng(400, issue.errors)
    end
  end

  def destroy
    if Issue.where( id: issue_params[:id] ).update( del_flg: issue_params[:del_flg] )
      issue = Issue.find(issue_params[:id])
      render_ok(issue)
    else
      render_ng(400, issue.errors)
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:id, :title, :body, :kind, :del_flg)
  end
end
