{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.Content.Orders.Cancel
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Cancels all line items in an order.
--
-- /See:/ <https://developers.google.com/shopping-content Content API for Shopping Reference> for @ContentOrdersCancel@.
module Network.Google.Resource.Content.Orders.Cancel
    (
    -- * REST Resource
      OrdersCancelResource

    -- * Creating a Request
    , ordersCancel'
    , OrdersCancel'

    -- * Request Lenses
    , ocQuotaUser
    , ocMerchantId
    , ocPrettyPrint
    , ocUserIP
    , ocKey
    , ocOrdersCancelRequest
    , ocOAuthToken
    , ocOrderId
    , ocFields
    ) where

import           Network.Google.Prelude
import           Network.Google.ShoppingContent.Types

-- | A resource alias for @ContentOrdersCancel@ which the
-- 'OrdersCancel'' request conforms to.
type OrdersCancelResource =
     Capture "merchantId" Word64 :>
       "orders" :>
         Capture "orderId" Text :>
           "cancel" :>
             QueryParam "quotaUser" Text :>
               QueryParam "prettyPrint" Bool :>
                 QueryParam "userIp" Text :>
                   QueryParam "key" Key :>
                     QueryParam "oauth_token" OAuthToken :>
                       QueryParam "fields" Text :>
                         QueryParam "alt" AltJSON :>
                           ReqBody '[JSON] OrdersCancelRequest :>
                             Post '[JSON] OrdersCancelResponse

-- | Cancels all line items in an order.
--
-- /See:/ 'ordersCancel'' smart constructor.
data OrdersCancel' = OrdersCancel'
    { _ocQuotaUser           :: !(Maybe Text)
    , _ocMerchantId          :: !Word64
    , _ocPrettyPrint         :: !Bool
    , _ocUserIP              :: !(Maybe Text)
    , _ocKey                 :: !(Maybe Key)
    , _ocOrdersCancelRequest :: !OrdersCancelRequest
    , _ocOAuthToken          :: !(Maybe OAuthToken)
    , _ocOrderId             :: !Text
    , _ocFields              :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'OrdersCancel'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ocQuotaUser'
--
-- * 'ocMerchantId'
--
-- * 'ocPrettyPrint'
--
-- * 'ocUserIP'
--
-- * 'ocKey'
--
-- * 'ocOrdersCancelRequest'
--
-- * 'ocOAuthToken'
--
-- * 'ocOrderId'
--
-- * 'ocFields'
ordersCancel'
    :: Word64 -- ^ 'merchantId'
    -> OrdersCancelRequest -- ^ 'OrdersCancelRequest'
    -> Text -- ^ 'orderId'
    -> OrdersCancel'
ordersCancel' pOcMerchantId_ pOcOrdersCancelRequest_ pOcOrderId_ =
    OrdersCancel'
    { _ocQuotaUser = Nothing
    , _ocMerchantId = pOcMerchantId_
    , _ocPrettyPrint = True
    , _ocUserIP = Nothing
    , _ocKey = Nothing
    , _ocOrdersCancelRequest = pOcOrdersCancelRequest_
    , _ocOAuthToken = Nothing
    , _ocOrderId = pOcOrderId_
    , _ocFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
ocQuotaUser :: Lens' OrdersCancel' (Maybe Text)
ocQuotaUser
  = lens _ocQuotaUser (\ s a -> s{_ocQuotaUser = a})

-- | The ID of the managing account.
ocMerchantId :: Lens' OrdersCancel' Word64
ocMerchantId
  = lens _ocMerchantId (\ s a -> s{_ocMerchantId = a})

-- | Returns response with indentations and line breaks.
ocPrettyPrint :: Lens' OrdersCancel' Bool
ocPrettyPrint
  = lens _ocPrettyPrint
      (\ s a -> s{_ocPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
ocUserIP :: Lens' OrdersCancel' (Maybe Text)
ocUserIP = lens _ocUserIP (\ s a -> s{_ocUserIP = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
ocKey :: Lens' OrdersCancel' (Maybe Key)
ocKey = lens _ocKey (\ s a -> s{_ocKey = a})

-- | Multipart request metadata.
ocOrdersCancelRequest :: Lens' OrdersCancel' OrdersCancelRequest
ocOrdersCancelRequest
  = lens _ocOrdersCancelRequest
      (\ s a -> s{_ocOrdersCancelRequest = a})

-- | OAuth 2.0 token for the current user.
ocOAuthToken :: Lens' OrdersCancel' (Maybe OAuthToken)
ocOAuthToken
  = lens _ocOAuthToken (\ s a -> s{_ocOAuthToken = a})

-- | The ID of the order to cancel.
ocOrderId :: Lens' OrdersCancel' Text
ocOrderId
  = lens _ocOrderId (\ s a -> s{_ocOrderId = a})

-- | Selector specifying which fields to include in a partial response.
ocFields :: Lens' OrdersCancel' (Maybe Text)
ocFields = lens _ocFields (\ s a -> s{_ocFields = a})

instance GoogleAuth OrdersCancel' where
        authKey = ocKey . _Just
        authToken = ocOAuthToken . _Just

instance GoogleRequest OrdersCancel' where
        type Rs OrdersCancel' = OrdersCancelResponse
        request = requestWithRoute defReq shoppingContentURL
        requestWithRoute r u OrdersCancel'{..}
          = go _ocQuotaUser _ocMerchantId (Just _ocPrettyPrint)
              _ocUserIP
              _ocKey
              _ocOAuthToken
              _ocOrderId
              _ocFields
              (Just AltJSON)
              _ocOrdersCancelRequest
          where go
                  = clientWithRoute
                      (Proxy :: Proxy OrdersCancelResource)
                      r
                      u