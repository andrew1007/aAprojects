profile_picture = "http://res.cloudinary.com/andoo/image/upload/c_crop,h_175,r_100,w_173,x_74,y_0/v1484764852/vonrulf1kpsuhqlxobir.png"

User.create!({username: "Guest", password:"password", profile_picture: profile_picture})

User.create!({username: "andrew", password:"password", profile_picture: profile_picture})
User.create!({username: "byran", password:"password", profile_picture: profile_picture})
User.create!({username: "jeff", password:"password", profile_picture: profile_picture})
User.create!({username: "john", password:"password", profile_picture: profile_picture})
User.create!({username: "zed", password:"password", profile_picture: profile_picture})
User.create!({username: "jessica", password:"password", profile_picture: profile_picture})
User.create!({username: "onesielover", password:"password", profile_picture: profile_picture})
User.create!({username: "dallas", password:"password", profile_picture: profile_picture})
User.create!({username: "raymond", password:"password", profile_picture: profile_picture})
User.create!({username: "Ahn", password:"password", profile_picture: profile_picture})
User.create!({username: "Eileen", password:"password", profile_picture: profile_picture})

# (1..10).each do |idx1|
#   (1..7).each do |idx2|
#     x = Follow.new
#     x.user_following_id= idx1
#     x.user_followed_by_id = (1..9).to_a.sample
#     x.save!
#   end
# end
#
# (1..10).each do |idx1|
#   (1..7).each do |idx2|
#     x = Follow.new
#     x.user_followed_by_id = idx1
#     x.user_following_id = (1..9).to_a.sample
#     x.save!
#   end
# end


g = Board.create!({id: 1000, user_id: 1, name:"I love dogs!"})
g.save

user_id = 1
board_id = 1


img = [
  "http://res.cloudinary.com/andoo/image/upload/v1484591800/dogs/23695_pets_vertical_store_dogs_small_tile_8._CB312176604_.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591797/dogs/adoptable-size.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591796/dogs/dog-650299.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591796/dogs/860-header-dog-breeds.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591796/dogs/Common-dog-behaviors-explained.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591797/dogs/Shake-shiver-and-tremble-Why-dogs-do-it.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591798/dogs/dog-candy-junk-food-599x340.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591807/dogs/Introducing-puppy-to-older-dogs.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591820/dogs/original.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591806/dogs/The_16_Dogs_That_Won8217t_Make_You_Sneeze_2060_2848.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591810/dogs/puppy-1.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591805/dogs/_1.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591803/dogs/dogs.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591804/dogs/bear-dogs-310__605.jpg",
  "https://cloudinary.com/console/media_library#/dialog/image/upload/dogs/15_Tiniest_Dog_Breeds_1718_3083",
  "http://res.cloudinary.com/andoo/image/upload/v1484591807/dogs/puppy-1_680-453.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484591799/dogs/b054f9bf75fe74a38995cb0ccc240af5.jpg"
]

img.each_index do |idx|
  x = Pin.new({user_id: user_id, board_id:1000, title:"", body:"",
    image_url:img[idx]}
  )
  x.save
end

Board.create!({id: 2000, user_id: 2, name:"knowledge"})

img2 =[
  "http://res.cloudinary.com/andoo/image/upload/v1484740744/4789e534b3ed678dcaaaad4bba077ced_aklulp.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484740754/how-the-jobs-market-has-changed-in-the-city_502918b9a6332_w1500_kkxpzj.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484740780/instagram-from-zero-to-a-billion_5029173d3a01b_w1500_vb0rhb.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484740737/d387147da2da7c13278cdde2cc6cbb7e_m3tioj.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484740728/789a101255bdd185d89b5f37e68f92bf_kjgupa.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484740724/1424168f8298bbafe4674b9f3fc86cbf_xamm0y.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484740721/dcb194269343dad3afb5d5d9ef54dc0d_qzoye9.jpg"
]

img2.each do |img|
  Pin.create!({user_id: 2, board_id: 2000, title: "", body:"",
    image_url: img})
end


img3=[
  "http://res.cloudinary.com/andoo/image/upload/v1484741118/6d70fe527c8f852a55db209f72ad714f_cxmzkk.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741120/d3068c320aa7d2325b6dd666302eb585_wwhyu9.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741240/following-twitter_50290b8ad822f_w1500_mgpos5.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741198/622c0114523a0f6e531cf292f13f3ad6_gymcil.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741221/15-of-the-Scariest-Things-Hacked_n2fobz.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741178/fb908f9e0a932d4a123b62aa28f02ed9_xzufaf.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741146/b9b4e30f6745e1c93ce5549fcf4aa58a_modqtb.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741171/203ba8a20c5532d8fe7e535cf40a2f4c_zbx4m2.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741174/7b4d0eb1c58833992d212c49364f8fe6_nchlfd.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741152/0c65b48a4964f83287e82396750bb0c7_vspl5a.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741140/c8005b21ffee77bf093b53491cad5bc3_xy6htm.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741129/7af0b23c13930a24acbf0a48891f8681_xcxlnz.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741129/7af0b23c13930a24acbf0a48891f8681_xcxlnz.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741123/d5b5c853c68db7d15f3c5f0bcce7e550_eozje6.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741123/d5b5c853c68db7d15f3c5f0bcce7e550_eozje6.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741120/d3068c320aa7d2325b6dd666302eb585_wwhyu9.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484741118/6d70fe527c8f852a55db209f72ad714f_cxmzkk.jpg"
]

Board.create!({id: 3000, user_id: 1, name:"Let's talk technology"})

img3.each do |img|
  Pin.create!({user_id: 1, board_id: 3000, title: "", body:"",
    image_url: img})
end



img5=[
  "http://res.cloudinary.com/andoo/image/upload/v1484742299/8a9173e41d1ad72fedc1f5ed82e9deae_mnp8no.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484742282/6cbee9f0c1a1a8d22e51c13a24096c63_m0bixx.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484742287/b76914b698cab009745d1d2c7c0f3b7a_kz90ua.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484742286/5a54b668ff5e1d955fbbb7938355a508_mbiigl.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484742287/a40933264f9b0b211c59d1a3ca6d09bf_k5rn1p.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484742279/d53a849245a01b22f26dcb9a9de0bd46_vqinmp.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484742281/311b447d14d69fa25227cee0bf70698a_uz4v74.jpg"
]

Board.create!({id: 4000, user_id: 1, name: "Fun facts"})

img5.each do |img|
  Pin.create!({user_id: 1, board_id: 4000, title: "", body:"",
    image_url: img})
end

img6 = [
  "http://res.cloudinary.com/andoo/image/upload/v1484916345/Tex-Mex_Bacon_Cheeseburgers_f69d_sm0yre.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484916345/Pomegranate_Feta_Bison_Burgers_nr9seh.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484916345/Pepper_Crusted_Bacon_Cheeseburgers_6ea9_gu3h1f.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484916345/Michael_Symon_s_Fat_Doug_c_jwneds.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484916345/d6ad79e959b39e3e23a200b03d343d2d_mdjyus.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484916344/Cheddar_Stuffed_Apple_Slaw_Burger_f9cc3_mpqixo.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484916344/Apple_Cheddar_Turkey_Burgers_chhfid.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484916344/Bacon_Brie_Burger_ek3v4c.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484916344/Beef_Chorizo_Sliders_n7nn3b.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484916344/Bourbon_Burgers_f01yop.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484916345/Cheddar_chicken_burgers_80_gm5ltu.jpg"
]

title6 = [
  "Tex-Mex Bacon Cheeseburgers",
  "Pomegranate Feta Bison Burgers",
  "Pepper Crusted Bacon Cheeseburgers",
  "Michael Symon's Fat Doug",
  "Cheddar Stuffed Apple Slaw Burger",
  "Apple Cheddar Turkey Burgers",
  "Bacon Brie Burger",
  "Beef Chorizo Sliders",
  "Bourbon Burgers",
  "Cheddar chicken burgers"
]

Board.create!({user_id: 2, id: 5000, name: "Burgers on burgers"})

img6.each_with_index do |pic, idx|
  Pin.create!({user_id: 2, board_id: 5000, title: title6[idx], body:"",
    image_url: pic})
end

img7 = [
  "http://res.cloudinary.com/andoo/image/upload/v1484918490/guillem-h-pongiluppi-501-st-legion-vader-s-fist-vs-space-cockroaches-7-guillemhp_vtrqcn.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918488/ed3313d88e3d66499f1703108b55c469_or1uug.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918488/c74176b662dbce095f19dbeb56c19d69_i0il3k.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918489/2578005d06193c9411c4b88941acfd05_xtmeri.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918488/614668cb4a1279a746de621ef0fa881f_tw4bjf.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918488/303726a9fbff20073a3115c7d6ccc2b2_peaxmz.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918487/030c4a5300bfc448ffd3bdb06cfd012f_jjvyuq.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918487/35f051be4e5f9ace286398d40f2b705d_houxfe.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918488/624ae36b528c24bcf93c89de7ca8ed5e_dwcxs0.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918487/02e3ebf534ee41ccf6a9b2639512bef7_mw7abj.jpg"
]

Board.create!({user_id: 3, id: 6000, name: "Star Wars!"})

img7.each do |img|
  Pin.create!({user_id: 3, board_id: 6000, title: "", body: "",
    image_url: img})
end


img8 = [
  "http://res.cloudinary.com/andoo/image/upload/v1484918949/e29b255b4aba7f51a5b02a25b758aed2_1_utub6u.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918949/d455518235eaaf43d69105925a04c3cf_merj38.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918947/cc162156e16348ba8f728f6f0240f854_jdysmh.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918946/c3cf306b7f1e8a9986589681bc802eaa_tcelji.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918946/b1f2195e7b2d9d903ec46a85074e1d52_pknmpd.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918947/adda56e5b0c19b73df664b081f57b3c1_ysix6z.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918941/9dea13259e9189bf414e806f2dd83b1b_y0yfji.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918942/73c2a371b1bb080b10f3b4116863d629_dthv6b.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918943/380b78c078b617ae850764431141ffb1_tkubvo.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918944/9342a1375c0c26b31bc495d9cadd0e39_xttaya.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918944/80306ca820723ce524217c74fa468043_hxblrr.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918944/277662384af4e81a1b2933c2b18bda6d_j1f2hh.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918944/7391863170be07a072ffeb3e7605db2a_yvfr4p.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918940/8f14b3a5bb42b8de002879f65c06e7c6_jk6een.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918940/6f00a85a6baa99e121c27e95737e3e49_f3onh8.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918938/6e36e8a856b73d01e68eddae94807c86_hi3n3p.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918936/1ca94a99f9ebe281b84844d3e4b791ef_pydqhh.jpg",
  "http://res.cloudinary.com/andoo/image/upload/v1484918936/0d7d59232066c0f25702f77644807b75_twrc4p.jpg"
]

Board.create!({user_id: 4, id: 7000, name: "Cute Animals"})

img8.each do |img|
  Pin.create!({user_id: 4, board_id: 7000, title: "", body: "",
    image_url: img})
end
