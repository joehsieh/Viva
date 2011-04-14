//
//  VivaPlayableTrack.m
//  Viva
//
//  Created by Daniel Kennett on 4/14/11.
//  Copyright 2011 Spotify. All rights reserved.
//

/*
 This is a very simple wrapper class that allows every single track in a context to be unique,
 whether they are or not. Needed to assist playback flow when a context has the same track(s)
 in it multiple times, and using indexes is stupid.
 */

#import "VivaTrackInPlaylistReference.h"

@interface VivaTrackInPlaylistReference ()

@property (copy, readwrite) NSString *uniqueId;
@property (assign, readwrite) __weak SPSpotifyTrack *track;
@property (assign, readwrite) __weak SPSpotifyPlaylist *playlist;

@end

@implementation VivaTrackInPlaylistReference

-(id)initWithTrack:(SPSpotifyTrack *)aTrack inPlaylist:(SPSpotifyPlaylist *)aPlaylist {
	if ((self = [super init])) {
		self.uniqueId = [[NSProcessInfo processInfo] globallyUniqueString];
		self.track = aTrack;
		self.playlist = aPlaylist;
	}
	return self;
}

@synthesize track;
@synthesize playlist;
@synthesize uniqueId;

-(BOOL)isEqual:(id)object {
	if ([object isKindOfClass:[VivaTrackInPlaylistReference class]]) {
		return [((VivaTrackInPlaylistReference *)object).uniqueId isEqualToString:self.uniqueId] && 
		((VivaTrackInPlaylistReference *)object).playlist == self.playlist && 
		((VivaTrackInPlaylistReference *)object).track == self.track;
	} else {
		return NO;
	}
}

- (void)dealloc {
	self.uniqueId = nil;
	self.track = nil;
	self.playlist = nil;
    [super dealloc];
}

@end
