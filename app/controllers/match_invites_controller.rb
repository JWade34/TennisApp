class MatchInvitesController < ApplicationController
  before_action :authenticate_user!

  def new
    @match_invite = MatchInvite.new(recipient_id: params[:recipient_id])
  end

  def create
    @match_invite = current_user.sent_invites.build(invite_params)
    @match_invite.status = 'pending'

    if @match_invite.save
      flash[:notice] = 'Match invite sent successfully!'
    else
      flash[:alert] = 'Failed to send match invite.'
    end
    redirect_to profile_path(@match_invite.recipient)
  end

  def index
    @sent_invites = current_user.sent_invites
    @received_invites = current_user.received_invites
  end

  def accept
    @match_invite = MatchInvite.find(params[:id])
    if @match_invite.recipient == current_user
      @match_invite.update(status: 'accepted')
      flash[:notice] = 'Match invite accepted!'
    else
      flash[:alert] = 'You are not authorized to accept this invite.'
    end
    redirect_to match_invites_path
  end

  private

  def invite_params
    params.require(:match_invite).permit(:recipient_id, :match_date)
  end
end
