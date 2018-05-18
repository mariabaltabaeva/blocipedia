module WikisHelper

   def user_can_delete_wiki?(wiki)
     current_user == wiki.user || current_user.admin?
   end
end
