package com.network.www.dao.inf;

import com.network.www.bean.NetworkComment;

public interface CommentInf {
	boolean publishComment(NetworkComment comment);
	boolean deleteComment(NetworkComment comment);
}
