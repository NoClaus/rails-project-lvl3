# frozen_string_literal: true

class BulletinPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def new?
    @user
  end

  def create?
    @user
  end

  def edit?
    @user
  end

  def update?
    author?
  end
end
