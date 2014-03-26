class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:destroy]
  before_action :set_group

  def create
    @subscription = current_user.subscriptions.build(group_id: params[:group_id])

    # if @subscription.save
    #   Notifier.subscription_confirmation(current_user, @group).deliver
    # end

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to groups_path, notice: 'You are now following' + ' ' + @group.name }
      else
        format.html { redirect_to group_path(@group.id), alert: 'Your request could not be processed at this time.' }
      end
    end
  end

  def destroy
    # Notifier.subscription_cancellation(current_user, @group).deliver

    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to groups_path, notice: @group.name + ' ' + 'is no longer being followed' }
      format.json { head :no_content }
    end
  end

  private

    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end
end
