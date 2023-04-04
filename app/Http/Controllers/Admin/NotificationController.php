<?php
namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Http\Controllers\Controller;
use App\Model\Notification;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use App\User;

class NotificationController extends Controller
{
    public function index(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if ($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $notifications = Notification::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->Where('title', 'like', "%{$value}%");
                }
            });
            $query_param = ['search' => $request['search']];
        }else{
            $notifications = new Notification();
        }
        $notifications = $notifications->latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.notification.index', compact('notifications','search'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'description' => 'required'
        ], [
            'title.required' => 'title is required!',
        ]);

        $notification = new Notification;
        $notification->title = $request->title;
        $notification->description = $request->description;

        if ($request->has('image')) {
            $notification->image = ImageManager::upload('notification/', 'png', $request->file('image'));
            $image = ImageManager::upload('notification/', 'png', $request->file('image'));
        } else {
            $notification->image = 'null';
            $image = '';
        }

        $notification->status             = 1;
        $notification->notification_count = 1;
        $notification->save();
        User::where('id', '>', 0)->update(['seen_notification' => 0]);
        try {
           // Helpers::send_push_notif_to_topic($notification);
           // Helpers::send_push_notif_to_device('drDCV-NyThyexVTA22VyLd:APA91bEnovra2IGAjETCh1iazmC_4K-gjhhgNz4yfy73v94VkbulNtElvN42Yo3XR07YsuU8q4MCcOGuNrGMnEx8GaA25PTSxsoZE8uTA6la_NVYPFB1Y3Nzd_wNTppZXUQdnV0qJfup', $notification);
           
            $content = array("en" => filter_var($request->description, FILTER_SANITIZE_STRING));
            $heading = array("en" => filter_var($request->title, FILTER_SANITIZE_STRING));

                $fields = array(
                    'app_id' => "c5fabebb-0e25-49e3-9438-4f1ffcfb42c5",
                    'included_segments' => array('All'),
                    'data' => array("foo" => "bar"),
                    'large_icon' =>'https://srilakshminarasimarlogistics.com/ecommerce/storage/app/public/company/2023-03-27-64215b6059fef.png',
                    'small_icon' =>'https://srilakshminarasimarlogistics.com/ecommerce/storage/app/public/company/2023-03-27-64215b6059fef.png',
                    'contents' => $content,
                    'headings' => $heading,
                    'big_picture' => 'https://srilakshminarasimarlogistics.com/ecommerce/storage/app/public/notification/' . $image
                );

                    $fields = json_encode($fields);
                    // print("\nJSON sent:\n");
                    // print($fields);

                        $ch = curl_init();
                        curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
                        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8',
                                                                   'Authorization: Basic YWJjZGIwOTktNzE2MC00MWI1LWFkN2UtODcyMTg1NDE3N2I0'));
                        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
                        curl_setopt($ch, CURLOPT_HEADER, FALSE);
                        curl_setopt($ch, CURLOPT_POST, TRUE);
                        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
                        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);    

                        $response = curl_exec($ch);
                        curl_close($ch);

                        // return $response;
                    //    $_SESSION['msg'] = "28";
                    //   header("Location:manage_notification.php");
                    //   exit;


                    // $response = sendMessage();
                    // $return["allresponses"] = $response;
                    // $return = json_encode( $return);
                    // // print("\n\nJSON received:\n");
                    // // print($return);
                    // // print("\n");
        } catch (\Exception $e) {
            Toastr::warning('Push notification failed!');
        }

        Toastr::success('Notification sent successfully!');
        return back();
    }

    public function edit($id)
    {
        $notification = Notification::find($id);
        return view('admin-views.notification.edit', compact('notification'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required',
            'description' => 'required',
        ], [
            'title.required' => 'title is required!',
        ]);

        $notification = Notification::find($id);
        $notification->title = $request->title;
        $notification->description = $request->description;
        $notification->image = $request->has('image')? ImageManager::update('notification/', $notification->image, 'png', $request->file('image')):$notification->image;
        $notification->save();

        Toastr::success('Notification updated successfully!');
        return redirect('/admin/notification/add-new');
    }

    public function status(Request $request)
    {
        if ($request->ajax()) {
            $notification = Notification::find($request->id);
            $notification->status = $request->status;
            $notification->save();
            $data = $request->status;
            return response()->json($data);
        }
    }

    public function resendNotification(Request $request){
        $notification = Notification::find($request->id);
        User::where('id', '>', 0)->update(['seen_notification' => 0]);
        $data = array();
        try {
            //Helpers::send_push_notif_to_topic($notification);
            $content = array("en" => filter_var($notification->description, FILTER_SANITIZE_STRING));
            $heading = array("en" => filter_var($notification->title, FILTER_SANITIZE_STRING));

                $fields = array(
                    'app_id' => "c5fabebb-0e25-49e3-9438-4f1ffcfb42c5",
                    'included_segments' => array('All'),
                    'data' => array("foo" => "bar"),
                    'large_icon' =>'https://srilakshminarasimarlogistics.com/ecommerce/storage/app/public/company/2023-03-27-64215b6059fef.png',
                    'small_icon' =>'https://srilakshminarasimarlogistics.com/ecommerce/storage/app/public/company/2023-03-27-64215b6059fef.png',
                    'contents' => $content,
                    'headings' => $heading,
                    'big_picture' => 'https://srilakshminarasimarlogistics.com/ecommerce/storage/app/public/notification/' . $notification->image
                );

                    $fields = json_encode($fields);
                    // print("\nJSON sent:\n");
                    // print($fields);

                        $ch = curl_init();
                        curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
                        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8',
                                                                   'Authorization: Basic YWJjZGIwOTktNzE2MC00MWI1LWFkN2UtODcyMTg1NDE3N2I0'));
                        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
                        curl_setopt($ch, CURLOPT_HEADER, FALSE);
                        curl_setopt($ch, CURLOPT_POST, TRUE);
                        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
                        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);    

                        $response = curl_exec($ch);
                        curl_close($ch);

                        // return $response;
                    //    $_SESSION['msg'] = "28";
                    //   header("Location:manage_notification.php");
                    //   exit;


                    // $response = sendMessage();
                    // $return["allresponses"] = $response;
                    // $return = json_encode( $return);
                    // // print("\n\nJSON received:\n");
                    // // print($return);
                    // // print("\n");
            $notification->notification_count += 1;
            $notification->save();

            $data['success'] = true;
            $data['message'] = \App\CPU\translate("Push notification successfully!");
        } catch (\Exception $e) {
            $data['success'] = false;
            $data['message'] = \App\CPU\translate("Push notification failed!");
        }

        return $data;
    }

    public function delete(Request $request)
    {
        $notification = Notification::find($request->id);
        ImageManager::delete('/notification/' . $notification['image']);
        $notification->delete();
        return response()->json();
    }
}
