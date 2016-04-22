import logging
import json
import glob
import argparse
from gensim import models
from gensim import matutils
from sklearn.feature_extraction.text import TfidfVectorizer
#from sklearn.feature_extraction.text import SPANISH_STOP_WORDS
from time import time
from nltk.corpus import stopwords
from nltk.tokenize import sent_tokenize

def main(K, numfeatures, sample_file, num_display_words, outputfile):
    K_clusters = K
    stop_words = set(stopwords.words('spanish')).union(set(['http','www','san', '099','098','096','097']))
    #stop_words = [word.decode('utf-8') for word in stopwords.words('spanish')]#stopwords.words("spanish")
    vectorizer = TfidfVectorizer(max_df=0.5, max_features=numfeatures,
                                     min_df=2, stop_words=set(stop_words),
                                     use_idf=True)

    text = []
    with open (sample_file, 'r') as f:
        text = f.readlines()

    t0 = time()
    print("Extracting features from the training dataset using a sparse vectorizer")
    X = vectorizer.fit_transform(text)
    print("done in %fs" % (time() - t0))
    print("n_samples: %d, n_features: %d" % X.shape)

    idf = vectorizer.idf_
    words = dict(zip(vectorizer.get_feature_names(), idf))

    terms = sorted(words, key=words.__getitem__)[0:10]

    # mapping from feature id to acutal word
    id2words ={}
    for i,word in enumerate(vectorizer.get_feature_names()):
        id2words[i] = word

    t0 = time()
    print("Applying topic modeling, using LDA")
    print(str(K_clusters) + " topics")
    corpus = matutils.Sparse2Corpus(X,  documents_columns=False)
    lda = models.ldamodel.LdaModel(corpus, num_topics=K_clusters, id2word=id2words)
    print("done in %fs" % (time() - t0))

    #write json version
    json_data = {"terms":terms,"topics":None}
    json_topics = []
    for i, item in enumerate(lda.show_topics(num_topics=K_clusters, num_words=num_display_words, formatted=False)):
        topic = {}
        topic['name']= "topic" + str(i)
        topic['children']= []
        for weight,term in item:
            child = {}
            child['name'] = term
            child['weight'] = weight
            topic['children'].append(child)
            #output_text.append( term + " : " + str(weight) )
        json_topics.append(topic)
    json_data['topics'] = json_topics

    with open(outputfile + ".json", 'w') as outfile:
        json.dump(json_data, outfile)


if __name__=="__main__":
    parser = argparse.ArgumentParser(description='This program takes in a file and some parameters and generates topic modeling from the file. This program assumes the file is a line corpus, e.g. list or reviews and outputs the topic with words and weights on the console.')

    parser.add_argument('-f', dest='path2datafile', default="crime-reports.txt",
                       help='Specifies the file which is used by to extract the topics. The default file is "review_sample_100000.txt"')

    parser.add_argument('-o', dest='outputfile', default="extracted_data",
                       help='Specifies the output file for the topics, The format is as a topic number followed by a list of words with corresdponding weights of the words. The default output file is "sample_topics.txt"')

    parser.add_argument('-K', default=1, type=int,
                       help='K is the number of topics to use when running the LDA algorithm. Default 100.')
    parser.add_argument('-featureNum', default=50000, type=int,
                       help='feature is the number of features to keep when mapping the bag-of-words to tf-idf vectors, (eg. lenght of vectors). Default featureNum=50000')
    parser.add_argument('-displayWN', default=15,type=int,
                       help='This option specifies how many words to display for each topic. Default is 15 words for each topic.')
    parser.add_argument('--logging', action='store_true',
                       help='This option allows for logging of progress.')


    args = parser.parse_args()
    #print args
    if args.logging:
        logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)

    print "using input file:", args.path2datafile
    main(args.K, args.featureNum, args.path2datafile, args.displayWN, args.outputfile)
