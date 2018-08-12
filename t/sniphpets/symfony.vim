describe "sniphpets#symfony#resolve_bundle_name"
    it "Should return a proper bundle name for an valid given FQN"
        let fqn = 'AppBundle\Entity\Contact'
        Expect sniphpets#symfony#resolve_bundle_name(fqn) == 'App'

        let fqn = 'FOS\UserBundle\Controller'
        Expect sniphpets#symfony#resolve_bundle_name(fqn) == 'User'

        let fqn = 'Symfony\Bundle\FrameworkBundle\Console'
        Expect sniphpets#symfony#resolve_bundle_name(fqn) == 'Framework'
    end

    it "Should return an empty string for an invalid given FQN"
        let fqn = 'App\Test\Php\Namespace'
        Expect sniphpets#symfony#resolve_bundle_name(fqn) == ''

        let fqn = 'Symfony\Component\Console\Shell'
        Expect sniphpets#symfony#resolve_bundle_name(fqn) == ''
    end
end
