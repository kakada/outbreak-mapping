# frozen_string_literal: true

class Team
  def self.members
    [
      { name: I18n.t('about.kakada'), image_url: 'kakada.jpeg', position: '', socials: [{ url: 'https://www.linkedin.com/in/kakada-chheang/', icon_class: 'fab fa-linkedin-in'}] },
      { name: I18n.t('about.radin'), image_url: 'radin.jpeg', position: '', socials: [{ url: 'https://www.linkedin.com/in/radinreth/', icon_class: 'fab fa-linkedin-in'}] },
      { name: I18n.t('about.borey'), image_url: 'borey.jpeg', position: '', socials: [{ url: 'https://www.linkedin.com/in/limborey/', icon_class: 'fab fa-linkedin-in'}] },
      { name: I18n.t('about.sokly'), image_url: 'sokly.jpeg', position: '', socials: [{ url: 'https://www.linkedin.com/in/heng-sokly-0296b16b/', icon_class: 'fab fa-linkedin-in'}] },
      { name: I18n.t('about.phalyka'), image_url: 'phalyka.jpeg', position: '', socials: [{ url: 'https://www.linkedin.com/in/samphoasphalyka-sok-88003b33/', icon_class: 'fab fa-linkedin-in'}] },
    ]
  end
end
