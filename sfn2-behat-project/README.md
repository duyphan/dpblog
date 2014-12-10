Symfony2 Blog Tutorials
========================

To run blog site please run command :
 
1. Git clone : https://github.com/duyphanasnet/symfony2-blog.git
2. Install composer : composer install 
3. To install mysql database. The first, we create database with name is "sfnBlog" on mysql db, then run "php app/console doctrine:migrations:diff" to diff the difference between mysql db and model on symfony2, run "php app/console doctrine:migrations:migrate" to migarate database. The last thing, we need run "php app/console doctrine:fixtures:load" to load data test on fixture data.
4. Run behat test : 
    - Install selenium and run it
    - Run command "bin/behat @BlogBundle"

[1]:  http://symfony.com/doc/2.3/book/installation.html
[2]:  http://getcomposer.org/
[3]:  http://symfony.com/download
[4]:  http://symfony.com/doc/2.3/quick_tour/the_big_picture.html
[5]:  http://symfony.com/doc/2.3/index.html
[6]:  http://symfony.com/doc/2.3/bundles/SensioFrameworkExtraBundle/index.html
[7]:  http://symfony.com/doc/2.3/book/doctrine.html
[8]:  http://symfony.com/doc/2.3/book/templating.html
[9]:  http://symfony.com/doc/2.3/book/security.html
[10]: http://symfony.com/doc/2.3/cookbook/email.html
[11]: http://symfony.com/doc/2.3/cookbook/logging/monolog.html
[12]: http://symfony.com/doc/2.3/cookbook/assetic/asset_management.html
[13]: http://symfony.com/doc/2.3/bundles/SensioGeneratorBundle/index.html