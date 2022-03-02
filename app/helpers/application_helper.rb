module ApplicationHelper
    def active_class(path)
        if request.path == path
            return 'active'
        else
            return ''
        end
    end

    def set_admin
        email = current_user.email
        regex = /factfamily.org/
        if regex.match(email)
            current_user.admin = true
            current_user.save
        end
    end
end
