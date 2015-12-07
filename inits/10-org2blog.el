(setq org2blog/wp-blog-alist
      '(("house-orange-farm"
         :url "http://oppapili.mydns.jp/wp/xmlrpc.php"
         :username "oppapili"
         :default-title nil
         :default-categories ("cooking" "programming" "game")
         :tags-as-categories t
         )))

(custom-set-variables '(org2blog/wp-use-tags-as-categories t))

(custom-set-variables '(org2blog/wp-use-sourcecode-shortcode t))
(custom-set-variables '(org2blog/wp-sourcecode-default-params nil))
