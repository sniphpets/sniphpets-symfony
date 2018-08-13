describe "sniphpets#symfony#bundle"
    it "Should return a proper bundle name for an valid given FQN"
        let fqn = 'AppBundle\Entity\Contact'
        Expect sniphpets#symfony#bundle(fqn) == 'App'

        let fqn = 'FOS\UserBundle\Controller'
        Expect sniphpets#symfony#bundle(fqn) == 'User'

        let fqn = 'Symfony\Bundle\FrameworkBundle\Console'
        Expect sniphpets#symfony#bundle(fqn) == 'Framework'
    end

    it "Should return an empty string for an invalid given FQN"
        let fqn = 'App\Test\Php\Namespace'
        Expect sniphpets#symfony#bundle(fqn) == ''

        let fqn = 'Symfony\Component\Console\Shell'
        Expect sniphpets#symfony#bundle(fqn) == ''
    end
end
