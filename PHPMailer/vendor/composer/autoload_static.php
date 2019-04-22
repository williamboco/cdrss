<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit532c4e94bc161422459049b6201a69da
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'PHPMailer\\PHPMailer\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'PHPMailer\\PHPMailer\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpmailer/phpmailer/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit532c4e94bc161422459049b6201a69da::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit532c4e94bc161422459049b6201a69da::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}