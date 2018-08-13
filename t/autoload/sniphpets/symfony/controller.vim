describe "sniphpets#symfony#controller#full_name"

    it "Should return a full name for a given controller"
        let fqn = 'App\Controller\BlogController'
        Expect sniphpets#symfony#controller#full_name(fqn) == 'Blog'

        let fqn = 'App\Controller\Admin\SuperDuperController'
        Expect sniphpets#symfony#controller#full_name(fqn) == 'Admin/SuperDuper'
    end

    it "Should return an empty string if it can't resolve a full name"
        let fqn = ''
        Expect sniphpets#symfony#controller#full_name(fqn) == ''

        let fqn = 'dkdjdkjddddd'
        Expect sniphpets#symfony#controller#full_name(fqn) == ''
    end

end
