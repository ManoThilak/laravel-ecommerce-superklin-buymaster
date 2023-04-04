<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use App\Model\Notification;
use App\User;
use App\CPU\Helpers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
class NotificationController extends Controller
{
    public function get_notifications(Request $request)
    {
        $user = Helpers::get_customer($request);
        // User::update('seen_notification', 1)->where('id', $user->id);
        DB::table('users')->where('id', $request->user()->id)->update([
            'seen_notification' => '1',
        ]);
        try {

            return response()->json(Notification::active()->orderBy('updated_at','DESC')->get(), 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
}
