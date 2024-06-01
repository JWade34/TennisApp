class MatchInvite < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates :sender_id, presence: true
  validates :recipient_id, presence: true
  validates :match_date, presence: true

  def create
    @invite = current_user.sent_invites.build(invite_params)
    @invite.status = 'pending'
    
    if @invite.save
      flash[:notice] = 'Match invite sent successfully!'
    else
      flash[:alert] = 'Failed to send match invite.'
    end
    redirect_to profile_path(@invite.recipient)
  end

  def index
    @received_invites = current_user.received_invites
  end

  private

  def invite_params
    params.require(:match_invite).permit(:recipient_id, :match_date)
  end
end
