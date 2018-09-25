require('pry')
require_relative('./models/bounty_hunter.rb')

BountyHunter.delete_all

  ig88 = BountyHunter.new({
    'name' => 'IG-88',
    'favourite_weapon' => 'Pulse Cannon',
    'homeworld' => 'Holowan Laboratories',
    'danger_level' => 'Extreme'
    })

  boba = BountyHunter.new({
    'name' => 'Boba Fett',
    'favourite_weapon' => 'Disintigration Cannon',
    'homeworld' => 'Kamino',
    'danger_level' => 'Medium'
    })

  dog = BountyHunter.new({
    'name' => 'Duane "Dog" Chapman',
    'favourite_weapon' => 'Pepper Spray',
    'homeworld' => 'Earth',
    'danger_level' => 'Low'
    })

  faye = BountyHunter.new({
    'name' => 'Faye Valentine',
    'favourite_weapon' => '.45 ACP Glock 30',
    'homeworld' => 'Earth',
    'danger_level' => 'Medium'
    })

    ig88.save
    boba.save
    dog.save
    faye.save
