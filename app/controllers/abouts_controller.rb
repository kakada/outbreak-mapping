class AboutsController < ApplicationController
  def show
    @teams = [
      { name: t('about.kakada'), image_url: 'https://cms-production-assets.s3-ap-southeast-1.amazonaws.com/1/teams/craig.jpg', position: 'Technical Manager', socials: [{ url: 'https://www.linkedin.com', icon_class: 'fab fa-linkedin-in'}] },
      { name: t('about.radin'), image_url: 'https://cms-production-assets.s3-ap-southeast-1.amazonaws.com/1/teams/craig.jpg', position: 'Technical Manager', socials: [{ url: 'https://www.linkedin.com', icon_class: 'fab fa-linkedin-in'}] },
      { name: t('about.borey'), image_url: 'https://cms-production-assets.s3-ap-southeast-1.amazonaws.com/1/teams/craig.jpg', position: 'Technical Manager', socials: [{ url: 'https://www.linkedin.com', icon_class: 'fab fa-linkedin-in'}] },
      { name: t('about.sokly'), image_url: 'https://cms-production-assets.s3-ap-southeast-1.amazonaws.com/1/teams/craig.jpg', position: 'Technical Manager', socials: [{ url: 'https://www.linkedin.com', icon_class: 'fab fa-linkedin-in'}] },
      { name: t('about.phalyka'), image_url: 'https://cms-production-assets.s3-ap-southeast-1.amazonaws.com/1/teams/craig.jpg', position: 'Technical Manager', socials: [{ url: 'https://www.linkedin.com', icon_class: 'fab fa-linkedin-in'}] },
    ]
  end
end
