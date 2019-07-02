require 'nokogiri'
require 'open-uri'
require 'rubocop-performance'
require 'byebug'
require 'pry'
require 'httparty'
require 'json'




def ability_parser


  x = "Janna: Tailwind EFFECT RADIUS:  1250  Innate: Janna passively gains  8% bonus movement speed and grants the same amount to nearby allied champions moving towards her.Janna's basic attacks and  Zephyr deal bonus on-hit magic damage equal to 25 / 35% (based on level) of her bonus  movement speed."
  w = '<span class="colorFF9900">Passive:</span> While Zephyr is not on cooldown, Janna gains {{ e1 }}% <span class="color99FF99">(+{{ f1 }}%)</span> Movement Speed and
 can move through units.<br /><br /><span class="colorFF9900">Active: </span>Deals {{ e2 }} <span class="color99FF99">(+{{ a1 }})</span> <span class="colorFFF673">(+{{ f3 }})</span> magic damage to an enemy and
 slows their Movement Speed by {{ e3 }}% <span class="color99FF99">(+{{ f2 }}%)</span> for {{ e4 }} seconds.'
  vayne_q = "Vayne rolls a short distance, and deals <scaleAD>{{ f1 }}</scaleAD> bonus physical damage on her next basic attack within {{ e3 }} seconds.
<br /><br />
<rules>Tumble's bonus damage is equal to {{ e1 }}% of Vayne's total attack damage.</rules>"
  vayne_w = "
Every third consecutive attack or ability against an enemy deals an additional {{ e1 }}% of the enemy's maximum health as true damage (no less than {{ e2 }}).
<br /><br /><rules>Silver Bolts deals no more than {{ e3 }} damage against monsters.</rules>"
  vayne_r = 'Vayne gains {{ e1 }} bonus attack damage and improvements to Night Hunter and Tumble for {{ e2 }} seconds.
The duration of Final Hour is extended by {{ e5 }} seconds whenever a champion damaged by Vayne dies within {{ e6 }} seconds.
<br /><br /><span class="colorF0F0F0">Night Hunter</span>: Vayne instead gains {{ e4 }} movement speed.<br /><span class="colorF0F0F0">Tumble</span>: Tumbles cooldown is reduced by {{ e7 }}%, and Vayne gains <span class="color91d7ee">Invisibility</span> for {{ e3 }} second when she Tumbles.<br /><br /><rules><span class="color91d7ee">Stealth - Invisible:</span> Vayne can only be revealed by nearby enemy Turrets or <span class="coloree91d7">True Sight</span>.<br />Final Hour's duration can't be increased beyond its original maximum duration.</rules>').to_s
  doc = Nokogiri::HTML::Document.parse(vayne_q)
  # puts vayne_q.scan(/\{{(.*?)\}}/)
  doc3 = Nokogiri::HTML(w).css("span").map {|cite| cite}

  puts doc3
end



ability_parser


