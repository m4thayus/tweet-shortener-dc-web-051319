def shorten?(word)
    dictionary = {
        "hello" => "hi",
        "to" => "2",
        "two" => "2",
        "too" => "2",
        "for" => "4",
        "four" => "4",
        "be" => "b",
        "you" => "u",
        "at" => "@",
        "and" => "&"
    }
    return dictionary.has_key?(word.downcase) ? dictionary[word.downcase] : word
end

def word_substituter(tweet)
    tweet.split.map{ |w| shorten?(w) }.join(' ')
end

def bulk_tweet_shortener(tweets)
    tweets.each do |tweet| 
        puts word_substituter(tweet)
    end
end

def selective_tweet_shortener(tweet)
    tweet.length > 140 ? word_substituter(tweet) : tweet
end

def shortened_tweet_truncator(tweet)
    tweet.length > 140 ? short_tweet = word_substituter(tweet) : short_tweet = tweet
    short_tweet.length > 140 ? tweet = "#{short_tweet.slice(0,137)}..." : tweet 
end
