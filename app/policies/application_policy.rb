class ApplicationPolicy
  attr_reader :user, :wiki

  #after_initialize { self.role ||= :standard }

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    false
  end

  def show?
    scope.where(:id => wiki.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
